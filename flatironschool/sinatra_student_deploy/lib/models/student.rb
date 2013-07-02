class Student
  extend Persistable::ClassMethods

  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY",
    :name => "TEXT",
    :tagline => "TEXT",
    :bio => "TEXT",
    :treehouse_profile => "TEXT"
  }

  def self.attributes
    ATTRIBUTES
  end

  def self.find_by(*args)
    args.flatten.each do |arg|
      define_singleton_method("find_by_#{arg}") do |value|
        result = self.database.execute "SELECT * FROM #{self.table_name} WHERE #{arg} = ?", value
        new_from_db(result.first)
      end
    end
  end

  find_by(self.attributes.keys)

  def self.find(id)
    self.find_by_id(id)
  end

  def self.all
    results = database.execute "SELECT * FROM students;"
    results.collect{|row| new_from_db(row)}
  end

  def self.attr_accessors
    self.attributes.keys.each do |k|
      attr_accessor k
    end
  end
  attr_accessors

  def self.database
    @@db ||= SQLite3::Database.new('./student.db')
  end

  def persisted?
    self.id
  end

  def save
    persisted? ? update : insert
  end

  def attributes
    self.class.attributes.keys.collect do |attribute|
      self.send(attribute)
    end
  end

  def attributes_for_sql
    self.attributes[1..-1]
  end

  def question_marks_for_sql
    ("?," * attributes_for_sql.size)[0..-2]
  end

  private
    def insert
      self.class.database.execute "INSERT INTO #{self.class.table_name} (#{self.class.column_names_for_insert}) VALUES (#{self.question_marks_for_sql})", self.attributes_for_sql
      self.id = self.class.database.last_insert_row_id
    end

    def update
      self.class.database.execute "UPDATE #{self.class.table_name} SET #{self.class.attributes_for_update} WHERE id = ?", [attributes_for_sql, self.id].flatten
    end
end
