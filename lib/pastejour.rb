require "dnssd"
require "socket"
require "webrick"

require "pastejour/version"

module Pastejour
  include Socket::Constants

  Paste   = Struct.new(:name, :host)
  PORT    = 42424
  SERVICE = "_pastejour._tcp"

  def self.get(name)
    waiting = Thread.new { sleep 5 }
    contents = nil

    service = DNSSD.browse(SERVICE) do |reply|
      # FIXME: fuck you, DNSSD.resolve. fuck you up your stupid ass.
      DNSSD.resolve(reply.name, reply.type, reply.domain) { raise "FOO!" }
    end

    waiting.join
    service.stop

    # FIXME: actually read the paste contents
    # TCPSocket.open("localhost", PORT).read

    contents
  end

  def self.serve(name, contents)
    DNSSD.register(name, SERVICE, "local", PORT) do |reply|
      puts "Pasting #{name}..."
    end

    server = WEBrick::GenericServer.new(:Port => PORT)

    trap "INT" do
      server.shutdown
      exit!
    end

    server.start do |socket|
      socket.print(contents)
      server.shutdown
    end
  end
end
