module ApplicationHelper								#modules give us a way to package together related methods
  # Returns the full title on a per-page basis.
  def full_title(page_title)      						#method definition
    base_title = "Ruby on Rails Tutorial Sample App"	#ariable assignment
    if page_title.empty?								#Boolean test
      base_title										#Implicit return
    else
      "#{base_title} | #{page_title}"					#String interpolation
    end
  end
#lab4 1
  def string_shuffle(s)
  	#s3 = "nemec family"
  	#s3 = s3.split('')
  	s = s.shuffle
  	return s
  end

  def persons
	 person1 = {first: "Tomio", last: "Honda"}
 	 person2 = {first: "Misako", last: "Honda"}
 	 person3 = {first: "Chie", last: "Honda"}
	 
 	 x = {father: person1, mother: person2, child: person3}

 	 return x[:father][:first] + " " + x[:father][:last]
 	end
 end
