def getAdherents()
    require "csv"
    a = []
    CSV.foreach("adherents.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les adherents ####################\n\n"
    a.each{|row|
        if ((row["id"] != nil) && (row["nom"] != nil) && (row["prenom"] != nil) && (row["tel"] != nil))
            puts row["id"].to_s+"\t"+row["nom"].to_s+"\t"+row["prenom"].to_s+"\t"+row["tel"].to_s
        end
    }
    
end

def getAdherent(id)
    require "csv"
    a = []
    i=0
    CSV.foreach("adherents.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici l\'adherent (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["id"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["nom"].to_s+"\t"+row["prenom"].to_s+"\t"+row["tel"].to_s
            i = 1
        end
    }
    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end
    
end

def AdherentAutorized?(id)
    require "csv"
    a = []
    i=0
    j = 0
    CSV.foreach("emprunts.csv", headers: true) do |row|
        a << row.to_hash
    end
    a.each{|row|
        if ((row["adherent"].to_s == id.to_s) && (row["type"].to_s == "document".to_s))
            i = i+1
        else
            if ((row["adherent"].to_s == id.to_s) && (row["type"].to_s == "laptop".to_s))
                j = j+1
            end
        end
    }
    if(i>=5 || j>=1)
        return false
    else 
        return true
    end

    
end

def Adherentexists?(id)
    require "csv"
    a = []
    CSV.foreach("adherents.csv", headers: true) do |row|
        a << row.to_hash
    end
    a.each{|row|
        if row["id"].to_s == id.to_s then
            return true

        end



    }
    return false
end

def deleteAdherent(id)
    require("csv")
    a = []
    CSV.foreach("adherents.csv", headers: true) do |row|
        if(row["id"].to_s != id.to_s)
            a << row.to_hash
        else
            if(row["id"].to_s == id.to_s)
                puts "\n\n################ Found and deleted ############"
            end
        end
    end
    headers =["id","nom","prenom","tel"]
    CSV.open('adherents1.csv', 'w') do |row|
        row << headers
        end
    a.each{|row|
        CSV.open("adherents1.csv", "a+") do |csv|
            csv << row.values
        end
    }
    File.delete("adherents.csv")
    File.rename("adherents1.csv", "adherents.csv")

end


class Adherent
    #Constructer
    def initialize(id,nom,prenom,tel)
        @id = id
        @nom = nom
        @prenom = prenom
        @tel = tel
    end

    #Getter
    def getId()
        return @id
    end

    def getNom()
        return @nom
    end

    def getPrenom()
        return @prenom
    end

    def getTel()
        return @tel
    end

    #Setter
    def setId(id)
        @id = id
    end

    def setNom(nom)
        @nom = nom
    end
    
    def setPrenom(prenom)
        @prenom = prenom
    end

    def setTel(tel)
        @tel = tel
    end


    #Adding data 

    def add()
        require "csv"
        headers =[@id,@nom,@prenom,@tel]
        if(!self.exists?)
            CSV.open('adherents.csv', 'a+') do |row|
            row << headers
            end
        else
            puts"\n\n################### Erreur cet adherent existe deja ##################"
        end
    end

    #Getting data

    def exists?()
        require "csv"
        a = []
        CSV.foreach("adherents.csv", headers: true) do |row|
            a << row.to_hash
        end
        a.each{|row|
            if row["id"].to_s == @id.to_s then
                return true

            end



        }
        return false
    end
    
    


end

