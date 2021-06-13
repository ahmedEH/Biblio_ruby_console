def getAuteurs()
    require "csv"
    a = []
    CSV.foreach("auteurs.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les auteurs ####################\n\n"
    a.each{|row|
        if ((row["id"] != nil) && (row["nom"] != nil) && (row["prenom"] != nil) && (row["document"] != nil))
            puts row["id"].to_s+"\t"+row["nom"].to_s+"\t"+row["prenom"].to_s+"\t"+row["document"].to_s
        end
    }
    
end

def getAuteur(id)
    require "csv"
    a = []
    i = 0
    CSV.foreach("auteurs.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici l\'auteur (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["id"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["nom"].to_s+"\t"+row["prenom"].to_s+"\t"+row["document"].to_s
            i = 1
        end
    }
    if(i == 0)
        puts"\n\n#################### Not found ####################\n\n"
    end
    
end


def Auteurexists?(id)
    require "csv"
    a = []
    CSV.foreach("auteurs.csv", headers: true) do |row|
        a << row.to_hash
    end
    a.each{|row|
        if row["id"].to_s == id.to_s then
            return true

        end



    }
    return false
end

def getAuteurDocument(id)
    require "csv"
    a = []
    i=0
    CSV.foreach("auteurs.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici l\'auteur (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["document"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["nom"].to_s+"\t"+row["prenom"].to_s+"\t"+row["document"].to_s
            i=1
        end
    }
    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end
    
end

def deleteAuteur(id,document)
    require("csv")
    a = []
    CSV.foreach("auteurs.csv", headers: true) do |row|
        if(row["id"].to_s != id.to_s || row["document"].to_s != document.to_s)
            a << row.to_hash
        else
            if(row["id"].to_s == id.to_s && row["document"].to_s == document.to_s)
                puts "\n\n################ Found and deleted ############"
            end
        end
    end
    headers =["id","nom","prenom","document"]
    CSV.open('auteurs1.csv', 'w') do |row|
        row << headers
        end
    a.each{|row|
        CSV.open("auteurs1.csv", "a+") do |csv|
            csv << row.values
        end
    }
    File.delete("auteurs.csv")
    File.rename("auteurs1.csv", "auteurs.csv")

end


class Auteur
    #Constructer
    def initialize(id,nom,prenom,document)
        @id = id
        @nom = nom
        @prenom = prenom
        @document = document
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

    def getDocument()
        return @document
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

    def setDocument(document)
        @document = document
    end


    #Adding data 

    def add()
        require "csv"
        headers =[@id,@nom,@prenom,@document]
        if(!self.exists?)
            CSV.open('auteurs.csv', 'a+') do |row|
            row << headers
            end
        else
            puts"\n\n################### Erreur cet auteur existe deja ##################"
        end
    end

    #Getting data

    def exists?()
        require "csv"
        a = []
        CSV.foreach("auteurs.csv", headers: true) do |row|
            a << row.to_hash
        end
        a.each{|row|
            if (row["id"].to_s == @id.to_s && row["document"].to_s == @document.to_s) then
                return true

            end



        }
        return false
    end
    
    


end

