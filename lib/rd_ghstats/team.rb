class Team

  def initialize(members)
    @members = members
  end

  def include?(user)
    @members.include? user
  end

  def self.pope
    self.new %w(andrehjr lucasandre brodock pedro-brentan jonatas)
  end

  def self.vikings
    self.new %w(danilodelponte lleos lucaskds thiago-sydow thiesen)
  end

  def self.vortex
    self.new %w(pedrovitti murilloflores LeoSL leonardorisch filipenasc)
  end

  def self.mushin
    self.new %w(guih jeanmatheussouto matheusteixeira pedronauck tchiarato)
  end

  def self.pudim
    self.new %w(geisonbiazus marcelinol mauriciokj nandosousafr)
  end

  def self.solucao
    self.new %w(rodrigoquaresma liviaamorim)
  end

  def self.infernal
    self.new %w(joaohornburg marcelorxaviers danielfmai xptavares)
  end

  def self.integracao
    self.new %w(brunogianni)
  end

  def self.legend
    self.new %w(pcasaretto)
  end
end
