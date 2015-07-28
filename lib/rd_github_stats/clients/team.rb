module RDGithubStats
  class Team
    attr_accessor :name, :members, :members_login

    def initialize(name, members_login)
      @name = name
      @members_login = members_login
      @members = members_login.map {|username| User.new(username)}
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
      self.new "VorteX", %w(pedrovitti murilloflores LeoSL leonardorisch filipenasc marcuscaum)
    end

    def self.mushin
      self.new "Mushin", %w(guih jeanmatheussouto matheusteixeira pedronauck tchiarato)
    end

    def self.pudim
      self.new "Pudim", %w(geisonbiazus marcelinol mauriciokj nandosousafr)
    end

    def self.solucao
      self.new "Solucao", %w(rodrigoquaresma liviamorim sibeltrame)
    end

    def self.infernal
      self.new "Infernal", %w(joaohornburg marcelorxaviers danielfmai xptavares cnascimentord)
    end

    def self.integracao
      self.new "Integracao", %w(brunogianni)
    end

    def self.legend
      self.new "Legend", %w(pcasaretto)
    end

    def self.all
      [pope, vikings, vortex, mushin, pudim, solucao, infernal, integracao, legend]
    end

    def self.find(teams, user)
      teams.each { |team| return team if team.include? user } && nil
    end
    
    def profiles
      @members.each_with_object({}) do |member, profiles| 
        profiles[member] = member.fetch
      end
    end

  end
end
