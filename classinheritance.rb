class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss
 #because when other classes inherit from employee subclass, might need to change whether they have/dont have boss, need to write method for boss then

  def initialize(name, title, salary, boss=nil)
    @name, @title, @salary = name, title, salary
    self.boss = boss
  end

  def boss=(boss) #assign boss to employee.new and add self to bosses' employees
    @boss = boss
    boss.add_employee(self) unless boss.nil? #any subclass inheriting from this parent class boss will have this method run unless boss.nil?
  end



  def bonus(multiplier)
    self.salary * multiplier
  end


end

class Manager < Employee
  attr_reader :employees
  def initialize
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
    employee
  end

  def bonus(multiplier)
    (self.subsalary) * multiplier
  end

  protected
  def subsalary
    subsalary = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
          subsalary += employee.salary + employee.subsalary
      else
        subsalary += employee.salary
      end
    end
    subsalary
  end
end
