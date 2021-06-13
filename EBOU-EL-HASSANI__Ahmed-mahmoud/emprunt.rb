def getEmprunts()
    require "csv"
    a = []
    CSV.foreach("emprunts.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les emprunts ####################\n\n"
    a.each{|row|
        if ((row["id"] != nil) && (row["adherent"] != nil) && (row["emprunte"] != nil) && (row["type"] != nil))
            puts row["id"].to_s+"\t"+row["adherent"].to_s+"\t"+row["emprunte"].to_s+"\t"+row["type"].to_s
        end
    }
    
end


def getEmprunte(id)
    require "csv"
    a = []
    i = 0
    CSV.foreach("emprunts.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici l'emprunt' (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["id"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["adherent"].to_s+"\t"+row["emprunte"].to_s+"\t"+row["type"].to_s
            i=1
        end
    }
    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end
    
end

def deleteEmprunt(id,adherent,emprunte)
    require("csv")
    a = []
    CSV.foreach("emprunts.csv", headers: true) do |row|
        if(row["id"].to_s != id.to_s || row["adherent"].to_s != adherent.to_s || row["emprunte"].to_s != emprunte.to_s)
            a << row.to_hash
        else
            if(row["id"].to_s == id.to_s && row["adherent"].to_s == adherent.to_s && row["emprunte"].to_s == emprunte.to_s)
                puts "\n\n################ Found and deleted ############"
            end
        end
    end
    headers =["id","adherent","emprunte","type"]
    CSV.open('emprunts1.csv', 'w') do |row|
        row << headers
        end
    a.each{|row|
        CSV.open("emprunts1.csv", "a+") do |csv|
            csv << row.values
        end
    }
    File.delete("emprunts.csv")
    File.rename("emprunts1.csv", "emprunts.csv")

end


class Emprunt
    #Constructer
    def initialize(id,adherent,emprunte,type)
        @id = id
        @adherent = adherent
        @emprunte = emprunte
        @type = type
    end

    #Getter
    def getId()
        return @id
    end

    def getAdherent()
        return @adherent
    end

    def getEmprunte()
        return @emprunte
    end

    def getType()
        return @type
    end

    #Setter
    def setId(id)
        @id = id
    end

    def setAdherent(adherent)
        @adherent = adherent
    end
    
    def setEmprunte(emprunte)
        @emprunte = emprunte
    end

    def setType(type)
        @type = type
    end


    #Adding data 

    def add()
        require "csv"
        headers =[@id,@adherent,@emprunte,@type]
        if(!self.exists?)
            CSV.open('emprunts.csv', 'a+') do |row|
            row << headers
            end
        else
            puts"\n\n################### Erreur cet emprunt existe deja ##################"
        end
    end

    #Getting data

    def exists?()
        require "csv"
        a = []
        CSV.foreach("emprunts.csv", headers: true) do |row|
            a << row.to_hash
        end
        a.each{|row|
            if (row["id"].to_s == @id.to_s && row["adherent"].to_s == @adherent.to_s && row["emprunte"].to_s == @emprunte.to_s && row["type"].to_s == @type.to_s) then
                return true

            end



        }
        return false
    end
    
    


end

