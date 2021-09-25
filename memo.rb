require "csv"

puts "1(新規のメモを作成) 2(既存のメモに追記)"
memo_type = gets.chomp
  
if memo_type == "1"
  puts "新しいファイルに名前を付けます"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  
  p "メモしたい内容を記入してください"
  p "完了したら Ctrl + D を押します"
  memo = $stdin.read
  
  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [memo]
  end
  
elsif memo_type == "2"
  puts "どのファイルに追記しますか？"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  
  p "追記したい内容を記入してください"
  p "完了したら Ctrl + D を押します"
  memo = $stdin.read
  
  CSV.open("#{file_name}.csv", "a") do |csv|
    csv << [memo]
  end
  
else
  puts "エラー：1,2のいずれかを入力してください"
end