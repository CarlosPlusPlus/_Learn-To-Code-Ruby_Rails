module Persistable
  module ClassMethods

    def new_from_db(row)
      new.tap do |s|
        attributes.keys.each_with_index do |attribute, index|
          s.send("#{attribute}=",row[index])
        end
      end
    end

    def table_name
      "#{self.to_s.downcase}s"
    end

    def drop
      database.execute "DROP TABLE IF EXISTS #{table_name};"
    end

    def table_exists?(table_name)
      database.execute "SELECT * FROM sqlite_master WHERE type = 'table' AND name = ?", table_name
    end

    def create_table
      database.execute "CREATE TABLE IF NOT EXISTS #{table_name} (
        #{attributes_for_create}
      )"
    end

    def attributes_for_create
      self.attributes.collect{|k,v| [k,v].join(" ")}.join(",")
    end

    def attributes_for_update
      self.attributes.keys.reject{|k| k == :id}.collect{|k| "#{k} = ?"}.join(",")
    end

    def column_names_for_insert
      self.attributes.keys[1..-1].join(",")
    end

  end
end
