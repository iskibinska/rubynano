require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

puts products_hash
# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

  products_hash["items"].each do |toy|
  
    full_price = toy["full-price"]
    
    puts  "Name of the toy:   #{toy['title']}"
    puts    "Retail price:    #{toy['full-price']}"

    total_nbr_purchases = 0
    sales = 0.00

     toy["purchases"].each do  |purchase|
         sales += purchase["price"]
         total_nbr_purchases +=  1
      end   

      average = sales/total_nbr_purchases

      puts  "Total number of purchases  is: #{total_nbr_purchases}"
      puts  "Total amount of sales   is: #{sales}"
      puts  "Average price is: #{average}"
 
      disc = (average/full_price.to_f)*100;
      puts  "Average discount  is: #{(100-disc).round(2)} %"


  end







	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

  brandcnt = Hash.new(0)
  brandp = Hash.new(0.00)
  brandrev = Hash.new(0.00)
  brandprod = Hash.new(0)    


  products_hash["items"].each do |toy|

   brandcnt[toy['brand']]  += toy['stock']
   brandprod[toy['brand']]  += 1 
   brandp[toy['brand']]   += toy['full-price'].to_f.round(2)

   toy["purchases"].each do  |purchase|

      brandrev[toy['brand']]  += purchase["price"]

    end   
  end

  totalrev =0.0
  brandcnt.each do |key,val|

  puts "Name of the brand:  #{key} "
  puts "Number of toys  #{val}"
  puts  "Average price of toys #{(brandp[key]/brandprod[key]).round(2)} "
  puts "Revenue:   #{brandrev[key].round(2)} "
  totalrev += brandrev[key]
   end
  
 puts "Total revenue:  #{totalrev.round(2)}"



