def getLaptops()
    require "csv"
    a = []
    CSV.foreach("laptops.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici les ordinateurs ####################\n\n"
    a.each{|row|
        if ((row["id"] != nil) && (row["marque"] != nil) && (row["nbr_copies"] != nil))
            puts row["id"].to_s+"\t"+row["marque"].to_s+"\t"+row["nbr_copies"].to_s
        end
    }
    
end


def Laptopexists?(id)
    require "csv"
    a = []
    CSV.foreach("laptops.csv", headers: true) do |row|
        a << row.to_hash
    end
    a.each{|row|
        if row["id"].to_s == id.to_s then
            return true

        end



    }
    return false
end
def getLaptop(id)
    require "csv"
    a = []
    i = 0
    CSV.foreach("laptops.csv", headers: true) do |row|
        a << row.to_hash
    end
    puts"\n\n#################### Voici l\'ordinateur (#{id}) ####################\n\n"
    a.each{|row|
        if ((row["id"].to_s == id.to_s))
            puts row["id"].to_s+"\t"+row["marque"].to_s+"\t"+row["nbr_copies"].to_s
            i = 1
        end
    }

    if(i==0)
        puts"\n\n######################### Not found ######################\n\n"
    end
    
end

def deleteLaptop(id)
    require("csv")
    a = []
    CSV.foreach("laptops.csv", headers: true) do |row|
        if(row["id"].to_s != id.to_s)
            a << row.to_hash
        else
            if(row["id"].to_s == id.to_s)
                puts "\n\n################ Found and deleted ############"
            end
        end
    end
    headers =["id","marque","nbr_copies"]
    CSV.open('laptops1.csv', 'w') do |row|
        row << headers
        end
    a.each{|row|
        CSV.open("laptops1.csv", "a+") do |csv|
            csv << row.values
        end
    }
    File.delete("laptops.csv")
    File.rename("laptops1.csv", "laptops.csv")

end


class Laptop
    #Constructer
    def initialize(id,marque,nbr_copies)
        @id = id
        @marque = marque
        @nbr_copies = nbr_copies
    end

    #Getter
    def getId()
        return @id
    end

    def getMarque()
        return @marque
    end

    def getNbr_copies()
        return @nbr_copies
    end

    #Setter
    def setId(id)
        @id = id
    end

    def setMarque(marque)
        @marque = marque
    end
    
    def setNbr_copies(nbr_copies)
        @nbr_copies = nbr_copies
    end


    #Adding data 

    def add()
        require "csv"
        headers =[@id,@marque,@nbr_copies]
        if(!self.exists?)
            CSV.open('laptops.csv', 'a+') do |row|
            row << headers
            end
        else
            puts"\n\n################### Erreur ce laptop existe deja ##################"
        end
    end

    #Getting data

    def exists?()
        require "csv"
        a = []
        CSV.foreach("laptops.csv", headers: true) do |row|
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

