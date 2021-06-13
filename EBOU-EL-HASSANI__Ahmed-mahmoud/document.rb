def getDocuments()
    require "csv"
    a = []
    CSV.foreach("documents.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les documents ####################\n\n"
    a.each{|row|
        if ((row["id"] != nil) && (row["title"] != nil) && (row["nbr_copies"] != nil) && (row["type"] != nil))
            puts row["id"].to_s+"\t"+row["title"].to_s+"\t"+row["nbr_copies"].to_s+"\t"+row["type"].to_s
        end
    }
    
end

def getDocument(id)
    require "csv"
    a = []
    i = 0
    CSV.foreach("documents.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici le document (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["id"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["title"].to_s+"\t"+row["nbr_copies"].to_s+"\t"+row["type"].to_s
            i=1
        end
    }
    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end
    
end


def rechercherTitre(mot)
    require "csv"
    a = []
    i = 0
    CSV.foreach("documents.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les document (#{mot}) ####################\n\n"
    a.each{|row|
        if ((row["title"].include? mot.to_s))
            puts row["id"].to_s+"\t"+row["title"].to_s+"\t"+row["nbr_copies"].to_s+"\t"+row["type"].to_s
            i=1
        end
    }
    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end

end


def Documentexists?(id)
    require "csv"
    a = []
    CSV.foreach("documents.csv", headers: true) do |row|
        a << row.to_hash
    end
    a.each{|row|
        if row["id"].to_s == id.to_s then
            return true

        end



    }
    return false
end

def deleteDocument(id)
    require("csv")
    a = []
    CSV.foreach("documents.csv", headers: true) do |row|
        if(row["id"].to_s != id.to_s)
            a << row.to_hash
        else
            if(row["id"].to_s == id.to_s)
                puts "\n\n################ Found and deleted ############"
            end
        end
    end
    headers =["id","title","nbr_copies","type"]
    CSV.open('documents1.csv', 'w') do |row|
        row << headers
        end
    a.each{|row|
        CSV.open("documents1.csv", "a+") do |csv|
            csv << row.values
        end
    }
    File.delete("documents.csv")
    File.rename("documents1.csv", "documents.csv")

end


class Document
    #Constructer
    def initialize(id,titre,nbr_copies,type)
        @id = id
        @titre = titre
        @nbr_copies = nbr_copies
        @type = type
    end

    #Getter
    def getId()
        return @id
    end

    def getTitre()
        return @titre
    end

    def getNbr_copies()
        return @nbr_copies
    end

    def getType()
        return @type
    end

    #Setter
    def setId(id)
        @id = id
    end

    def setTitre(titre)
        @titre = titre
    end
    
    def setNbr_copies(nbr_copies)
        @nbr_copies = nbr_copies
    end

    def setType(type)
        @type = type
    end


    #Adding data 

    def add()
        require "csv"
        headers =[@id,@titre,@nbr_copies,@type]
        if(!self.exists?)
            CSV.open('documents.csv', 'a+') do |row|
            row << headers
            end
        else
            puts"\n\n################### Erreur ce document existe deja ##################"
        end
    end

    #Getting data

    def exists?()
        require "csv"
        a = []
        CSV.foreach("documents.csv", headers: true) do |row|
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

