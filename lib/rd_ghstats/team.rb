class Team
  attr_reader :name, :members

  def initialize(name, members)
    @name = name
    @members = members
  end

  def include?(user)
    @members.include? user
  end

  def self.pope
    self.new "POPE", %w(andrehjr lucasandre brodock pedro-brentan jonatas)
  end

  def self.vikings
    self.new "Vikings", %w(danilodelponte lleos lucaskds thiago-sydow thiesen)
  end

  def self.vortex
    self.new "VorteX", %w(pedrovitti murilloflores LeoSL leonardorisch filipenasc)
  end

  def self.mushin
    self.new "Mushin", %w(guih jeanmatheussouto matheusteixeira pedronauck tchiarato)
  end

  def self.pudim
    self.new "Pudim", %w(geisonbiazus marcelinol mauriciokj nandosousafr)
  end

  def self.solucao
    self.new "Solucao", %w(rodrigoquaresma liviaamorim sibeltrame)
  end

  def self.infernal
    self.new "Infernal", %w(joaohornburg marcelorxaviers danielfmai xptavares)
  end

  def self.integracao
    self.new "Integracao", %w(brunogianni)
  end

  def self.legend
    self.new "Legend", %w(pcasaretto)
  end
end
