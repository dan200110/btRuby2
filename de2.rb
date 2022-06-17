class Employees 

    $basic_salary = 3000

    def initialize n, i, d, w
        @name = n
        @id = i
        @department = d
        @working_hours = w
    end

    def getName
        @name
    end

    def getId
        @id
    end

    def getDepartment
        @department
    end

    def getWorking_hours
        @working_hours
    end

    def caculate_salary
        @working_hours * $basic_salary
    end

    def get_information 
        puts "id = #{@id}, name = #{@name}, department = #{@department}, working_hours = #{@working_hours}"
    end
end

class Dev < Employees
    def initialize n, i, d, w, ot
        @name, @id, @department, @working_hours, @ot_hours = n, i,d,w,ot
    end

    def getOt 
       puts "hello" 
    end

    def request_ot
        $basic_salary*@ot_hours*1.5
    end

    def caculate_salary
        $basic_salary*@working_hours*1.15 + $basic_salary*@ot_hours*1.5
    end

    def get_information 
        puts "id = #{@id}, name = #{@name}, department = #{@department}, working_hours = #{@working_hours}, ot_hours = #{@ot_hours}"
    end

end

class Tester < Employees
    def caculate_salary
        $basic_salary*@working_hours*1.1
    end
end

class Qa < Employees
    def initialize n, i, d, w, ot
        @name, @id, @department, @working_hours, @ot_hours = n, i,d,w,ot
    end

    def getOt 
        @ot_hours
    end

    def request_ot
        @ot_hours*basic_salary*1.5
    end

    def caculate_salary
        $basic_salary*@working_hours + $basic_salary*@ot_hours*1.5
    end

    def get_information 
        puts "id = #{@id}, name = #{@name}, department = #{@department}, working_hours = #{@working_hours}, ot_hours = #{@ot_hours}"
    end
end

class Bo < Employees
end

class Infra < Employees
end

listEmployees = Array.new

def inputEmployees(le)
    puts "Nhap thong tin"

    print "Nhap Department: [Dev, Qa, Tester,...]  "
    department = gets.chomp
    if department == "Dev" or department == "Qa"
        print "Nhap Id: "
        id = gets.chomp
        print "Nhap ten: "
        name = gets.chomp 
        print "Nhap so gio lam: "
        working_hours = gets.chomp.to_i
        print "Nhap so gio lam them: "
        ot_hours = gets.chomp.to_i
        if department == "Dev"
            dev = Dev.new name, id, department, working_hours, ot_hours
            le.push dev
        else
            qa = Qa.new name, id, department, working_hours, ot_hours
            le.push qa
        end
    else
        print "Nhap Id: "
        id = gets.chomp
        print "Nhap ten: "
        name = gets.chomp 
        print "Nhap so gio lam: "
        working_hours = gets.chomp.to_i

        if department == "Tester"
            tester = Tester.new name, id, department, working_hours
            le.push tester
        else
            employee = Employees.new name, id, department, working_hours
            le.push employee
        end
    end
end

print "Nhap so nhan vien: "
num_of_employees = gets.chomp.to_i
for i in (1..num_of_employees)
    inputEmployees(listEmployees)
end

# Print all employees
puts "\nDanh sach nhan vien la"
listEmployees.each {|e| e.get_information}

# Print all employees id have salary >5000

puts "\nDanh sach Id nhan vien co luong > 5000 la"
listEmployees.each {|e| puts e.getId if e.caculate_salary.round > 5000} 


print "Do you want to add one more employee Y/N? "
answer = gets.chomp 
    if answer =="Y" or answer =="y"
        inputEmployees(listEmployees)

        # Print all employees
        puts "\nDanh sach nhan vien moi la"
        listEmployees.each {|e| e.get_information}

        # Print all employees id have salary >5000
        puts "\nDanh sach Id nhan vien co luong > 5000 la"
        listEmployees.each {|e| puts e.getId if e.caculate_salary.round > 5000} 
    else
    end


