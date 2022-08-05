############################ Warming up... Fibonacci recursion
def fibs(number)
  temparr = [0,1]
  return temparr[0] if number == 1
  return temparr if number == 2
  return nil if number < 1
  for i in (1..number-2) do
    temparr.push(temparr[-1]+temparr[-2])
  end
  temparr
end

def fibs_rec(number)
  return "Error: negative number" if number < 1
  return [0] if number == 1
  return [0,1] if number == 2
  fibs_rec(number-1).push(fibs_rec(number-1)[-1] + fibs_rec(number-1)[-2])
end

p fibs(10)
p fibs_rec(10)
#################################
# Merge Sort
def merge_sort(array, new_array = [])
  return array if array.length == 1
  mid = array.length/2
  array1 = merge_sort(array[0..mid-1])
  array2 = merge_sort(array[mid..-1])
  (array1.length + array2.length).times do
    new_array.push(array1.shift) if array2.empty? && !array1.empty?
    new_array.push(array2.shift) if array1.empty? && !array2.empty?
    new_array.push(array1[0] <= array2[0] ? array1.shift : array2.shift) unless array1.empty? || array2.empty?
  end
  new_array
end

def generate_array(number)
  array = []
  number.times do
    array.push(rand(1000))
  end
  p array
  array
end

p merge_sort(generate_array(50))