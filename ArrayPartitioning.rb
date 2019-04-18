puts"Enter the length of the array"
$length=gets.to_i
puts $length
puts"Enter the elements"

arr = Array.new
$arr1 = Array.new
$arr2 = Array.new

def read_array(arr)
    i=0
    loop do
        x=gets.to_i
        arr.push(x)
        i+=1
    break if i>$length-1
    end
    return arr
end

def array_partition(arr)
    ok=0
    while arr.size>0
        if arr.size>2
            if ok==0 
                $arr1.push(arr.max)
                $arr1.push(arr.min)
                ok=1
            else
                $arr2.push(arr.max)
                $arr2.push(arr.min)
                ok=0
            end
            arr.delete(arr.max)
            arr.delete(arr.min)
        else
            if ok==0
                $arr1.push(arr.min)
                ok=1
            else
                 $arr2.push(arr.min)
            end
            arr.delete(arr.min)
        end
    end
    if $length % 2 != 0 #for arrays with an odd size
        odd_size()
    end
end

def odd_size()

    sum1 = sum_elements($arr1)
    sum2 = sum_elements($arr2)
    if sum1 > sum2
        dif = sum1-sum2
        if dif > $arr1.min
            check = (dif/2.0).ceil
            closeVal = $arr1.min_by{|y| (check-y).abs} #find the closest value of checkl from array
            $arr2.push(closeVal)    
            $arr1.delete(closeVal)
        end
    else
        if sum2 > sum1
            dif = sum2-sum1
            if dif > $arr2.min
                check = (dif/2.0).ceil
                closeVal = $arr1.min_by{|y| (check-y).abs} #find the closest value of checkl from array
                $arr1.push(closeVal)    
                $arr2.delete(closeVal)
            end
        end
    end
end

def sum_elements(arr)
    sum=0
    arr.each do |y|
        sum+=y
    end
    return sum
end


arr = read_array(arr)
print arr
puts "\n"
array_partition(arr)

puts "First array"
sum1 = sum_elements($arr1)
print $arr1, "; sum: ",sum1
puts "\n"

puts "Second array"
sum2 = sum_elements($arr2)
print $arr2, "; sum: ",sum2
puts "\n"

if sum1>sum2
    print "The difference between the sums is: ", sum1-sum2
else
    print "The difference between the sums is: ", sum2-sum1
end

