def first_anagram?(str1, str2)
  perms = str1.split("").permutation(str1.length).to_a.map{|word| word.join("")}
  perms.include?(str2)
end

def second_anagram?(str1, str2)
  str1 = str1.split("")
  str2 = str2.split("")
  str1.each do |char|
    str2.delete_at(str2.find_index(char))
  end
  str2.empty?
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new{|h, k| h[k] = 0}
  str2_hash = Hash.new{|h, k| h[k] = 0}
  str1.split("").each do |char|
    str1_hash[char] += 1
  end
  str2.split("").each do |char|
    str2_hash[char] += 1
  end
  str1_hash==str2_hash
end

p fourth_anagram?("elvis", "lives")
