require "dnssd"
require "socket"
require "webrick"
require "set"
require "pastejour/version"

Thread.abort_on_exception = true

module Pastejour
  include Socket::Constants

  Paste   = Struct.new(:name, :host, :port)
  PORT    = 42424
  SERVICE = "_pastejour._tcp"

  def self.find(name, first=true)
    hosts = Set.new

    waiting = Thread.current

    service = DNSSD.browse(SERVICE) do |reply|
      if name === reply.name
        DNSSD.resolve(reply.name, reply.type, reply.domain) do |rr|
          hosts << Paste.new(reply.name, rr.target, rr.port)
          waiting.run if first
        end
      end
    end

    sleep 5
    service.stop

    hosts
  end

  def self.get(name)
    hosts = find(name)

    if hosts.empty?
      STDERR.puts "ERROR: Unable to find #{name}"
    elsif hosts.size > 1
      STDERR.puts "ERROR: Multiple possibles found:"
      hosts.each do |host|
        STDERR.puts "  #{host.name} (#{host.host}:#{host.port})"
      end
    else
      # Set is weird. There is no #[] or #at
      hosts.each do |host|
        STDERR.puts "(#{host.name} from #{host.host}:#{host.port})"
        sock = TCPSocket.open host.host, host.port
        return sock.read
      end
    end
  end

  def self.serve(name, multiple, contents)
    tr = DNSSD::TextRecord.new
    tr['description'] = File.read("#{path}/.git/description") rescue "a git project"
    
    DNSSD.register(name, SERVICE, "local", PORT, tr.encode) do |reply|
      puts "Pasting #{name}..."
    end

    log = WEBrick::Log.new(true) # true fools it
    def log.log(*anything); end # send it to the abyss

    server = WEBrick::GenericServer.new(:Port => PORT, :Logger => log)

    trap "INT" do
      server.shutdown
      exit!
    end

    server.start do |socket|
      socket.print(contents)
      server.shutdown unless multiple
    end
  end
end
