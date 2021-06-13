

def menu()
    puts"\n\n############################# MENU ###############################\n\n"
    puts"0- Sortir\n\n"
    puts"1- Creer un adherent et l'ajouter a la bibliotheque\n\n"
    puts"2- Creer un document et l'ajouter a la bibliotheque\n\n"
    puts"3- Creer un ordinateur et l'ajouter a la bibliotheque\n\n"

    puts"4- Retourner un adherent correspondant a un id de personne\n\n"
    puts"5- Retourner un laptop correspondant a un id\n\n"
    puts"6- Retourner un document correspondant a un id\n\n"

    puts"7- Retourner l'ensemble des adherents\n\n"
    puts"8- Retourner l'ensemble des laptops\n\n"
    puts"9- Retourner l'ensemble des documents\n\n"

    puts"10-Ajouter une personne aux auteurs d'un livre\n\n"
    puts"11-Retourner un auteur d'un livre correspondant a un id\n\n"
    puts"12-Retourner l'ensemble des auteurs\n\n"

    puts"13-Supprimer un adherent de la bibliotheque\n\n"
    puts"14-Supprimer un laptop de la bibliotheque\n\n"
    puts"15-Supprimer un document de la bibliotheque\n\n"

    puts"16-Emprunter un ordinateur\n\n"
    puts"17-Emprunter un document\n\n"

    puts"18-Rendre un ordinateur\n\n"
    puts"19-Rendre un document\n\n"

    puts"20-Rechercher les document dont le titre contenant un mot\n\n\n\n"

    print"\t\tEntrer votre choix :"

    choix = gets
return choix


end

def main(choix)
    if(choix.to_i == 0)
        exit
    else
        if(choix.to_i < 0 || choix.to_i > 20)
            puts "Erreur de choix"
            main(menu())
        else
            case choix.to_i
            when 1
                puts"######### Creation d'un adherent ############"
                print"\t\tid :"
                id = gets.to_i
                print"\n\t\tnom :"
                nom = gets.to_s.chomp
                print"\n\t\tprenom :"
                prenom = gets.to_s.chomp
                print"\n\t\t telephone :"
                tel = gets.to_s.chomp
                a = Adherent.new(id,nom,prenom,tel)
                a.add()
                getAdherent(id)
                main(menu())
            when 2
                puts"######### Creation d'un document ############"
                print"\t\tid :"
                id = gets.to_i
                print"\n\t\ttitre :"
                titre = gets.to_s.chomp
                print"\n\t\tnombre de copies :"
                nbr = gets.to_s.chomp
                print"\n\t\t type(livre,revue,BD ou autre) :"
                type = gets.to_s.chomp
                a = Document.new(id,titre,nbr,type)
                a.add()
                getDocument(id)
                main(menu())
            when 3
                puts"######### Creation d'un ordinateur ############"
                print"\t\tid :"
                id = gets.to_i
                print"\n\t\tmarque :"
                marque = gets.to_s.chomp
                print"\n\t\tnombre de copies :"
                nbr = gets.to_s.chomp
                a = Laptop.new(id,marque,nbr)
                a.add()
                getLaptop(id)
                main(menu())
            when 4
                puts"######### Retourne un adherent ############"
                print"\t\tid :"
                id = gets.to_i
                getAdherent(id)
                main(menu())
            when 5
                puts"######### Retourne un ordinateur ############"
                print"\t\tid :"
                id = gets.to_i
                getLaptop(id)
                main(menu())
            when 6
                puts"######### Retourne un document ############"
                print"\t\tid :"
                id = gets.to_i
                getDocument(id)
                main(menu())
            when 7
                puts"######### Retourne Lèensemble des adherents ############"
                getAdherents()
                main(menu())
            when 8
                puts"######### Retourne Lèensemble des ordinateurs ############"
                getLaptops()
                main(menu())
            when 9
                puts"######### Retourne Lèensemble des documents ############"
                getDocuments()
                main(menu())
            when 10
                puts"######### Ajout dèun auteur a un document ############"
                print"\t\tid document :"
                id = gets.to_i
                if(Documentexists?(id))
                    print"\t\tid auteur :"
                    id_a = gets.to_i
                    print"\n\t\tnom :"
                    nom = gets.to_s.chomp
                    print"\n\t\tprenom :"
                    prenom = gets.to_s.chomp
                    a = Auteur.new(id_a,nom,prenom,id)
                    a.add()
                    getAuteur(id_a)
                else
                    puts"\n\n\t############## Erreur ce document n'existe pas #####################\n\n"
                end
                main(menu())
            when 11
                puts"######### Retourne un auteur ############"
                print"\t\tid :"
                id = gets.to_i
                getAuteur(id)
                main(menu())
            when 12
                puts"######### Retourne Lèensemble des auteurs ############"
                getAuteurs()
                main(menu())
            when 13
                puts"######### Suppression d'un adherent ############"
                print"\t\tid :"
                id = gets.to_i
                deleteAdherent(id)
                main(menu())
            when 14
                puts"######### Suppression d'un ordinateur ############"
                print"\t\tid :"
                id = gets.to_i
                deleteLaptop(id)
                main(menu())
            when 15
                puts"######### Suppression d'un document ############"
                print"\t\tid :"
                id = gets.to_i
                deleteDocument(id)
                main(menu())
            when 16
                puts"######### Emprunter un ordinateur ############"
                print"\t\tid ordinateur :"
                id_o = gets.to_i
                print"\t\tid d'adherent :"
                id_a = gets.to_i
                if(!Laptopexists?(id_o))
                    puts"\n\n\t############## Erreur cet ordinateur n'existe pas #####################\n\n"
                else
                    if(!Adherentexists?(id_a))
                        puts"\n\n\t############## Erreur cet adherent n'existe pas #####################\n\n"
                    else
                        if(!AdherentAutorized?(id_a))
                            puts"\n\n\t############## cet adherent n'est autorise pour emprunter #####################\n\n"
                        else
                            print"\t\tid emprunt :"
                            id_e = gets.to_i
                            type = "laptop"
                            a = Emprunt.new(id_e,id_a,id_o,type)
                            a.add()
                            getEmprunte(id_e)
                        end
                    end
                end
                main(menu())
            when 17
                puts"######### Emprunter un document ############"
                print"\t\tid document :"
                id_o = gets.to_i
                print"\t\tid d'adherent :"
                id_a = gets.to_i
                if(!Documentexists?(id_o))
                    puts"\n\n\t############## Erreur ce document n'existe pas #####################\n\n"
                else
                    if(!Adherentexists?(id_a))
                        puts"\n\n\t############## Erreur cet adherent n'existe pas #####################\n\n"
                    else
                        if(!AdherentAutorized?(id_a))
                            puts"\n\n\t############## cet adherent n'est autorise pour emprunter #####################\n\n"
                        else
                            print"\t\tid emprunt :"
                            id_e = gets.to_i
                            type = "document"
                            a = Emprunt.new(id_e,id_a,id_o,type)
                            a.add()
                            getEmprunte(id_e)
                        end
                    end
                end
                main(menu())
            when 18
                puts"######### Rendre un ordinateur ############"
                print"\t\tid ordinateur :"
                id_o = gets.to_i
                print"\t\tid d'adherent :"
                id_a = gets.to_i
                print"\t\tid d'emprunt :"
                id_e = gets.to_i
                type = "laptop"
                a = Emprunt.new(id_e,id_a,id_o,type)
                if(!Laptopexists?(id_o))
                    puts"\n\n\t############## Erreur cet ordinateur n'existe pas #####################\n\n"
                else
                    if(!Adherentexists?(id_a))
                        puts"\n\n\t############## Erreur cet adherent n'existe pas #####################\n\n"
                    else
                        if(!a.exists?)
                            puts"\n\n\t############## cet emprunt n'existe pas #####################\n\n"
                        else
                            deleteEmprunt(id_e,id_a,id_o)
                        end
                    end
                end
                main(menu())
            when 19
                puts"######### Rendre un document ############"
                print"\t\tid document :"
                id_o = gets.to_i
                print"\t\tid d'adherent :"
                id_a = gets.to_i
                print"\t\tid d'emprunt :"
                id_e = gets.to_i
                type = "document"
                a = Emprunt.new(id_e,id_a,id_o,type)
                if(!Documentexists?(id_o))
                    puts"\n\n\t############## Erreur cet document n'existe pas #####################\n\n"
                else
                    if(!Adherentexists?(id_a))
                        puts"\n\n\t############## Erreur cet adherent n'existe pas #####################\n\n"
                    else
                        if(!a.exists?)
                            puts"\n\n\t############## cet emprunt n'existe pas #####################\n\n"
                        else
                            deleteEmprunt(id_e,id_a,id_o)
                        end
                    end
                end
                main(menu())
            when 20
                puts"######### Rechercher des document par mot ############"
                print"\t\tmot :"
                mot = gets.to_s.chomp
                rechercherTitre(mot)
                main(menu())
            end
        end
    end  
    
end




