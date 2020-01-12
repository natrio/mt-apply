require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #data = File.open(args[0], "r:ISO-8859-1")
    #data = CSV.parse(data, headers: false)
    CSV.foreach(args[0], "r:ISO-8859-1", {headers: :first_row, col_sep: ';'}) do |row|

      Intercommunality.find_or_create_by!(siren: row['siren_epci']) do |interco|
        interco.name = row['nom_complet']
        interco.form = row['form_epci'] == 'METRO' ? 'met' : row[3].downcase
      end

      Commune.find_or_create_by!(code_insee: row['insee']) do |commune|
        commune.name = row['nom_com']
        commune.population = row['pop_total']
        commune.intercommunality_id = Intercommunality.find_by_siren(row['siren_epci']).id
      end
    end
  end
end
