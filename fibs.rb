# generates, stores and calculates retained fibonacci sequence numbers

class Fibs
  attr_accessor :generated_fibs

  def generated_fibs
    @generated_fibs||=[]
  end

  def generate x
    if generated_fibs.length < x
      generate_fibs x
    else
      generated_fibs.take x
    end
  end

  def is_known_fib? num
      generated_fibs.include? num
  end

  def all_fibs? seq_array
    seq_array.each do |n|
      return false if ! is_known_fib? n
    end
    true
  end

  def known_fibs_sum_of_squares
    generated_fibs.inject(0){|sum_of_squares,x| sum_of_squares+x**2 }
  end

  private

  def generate_fibs x
    # this method should do the work of generating the sequence
    y = generated_fibs.length
    (y...x).each do |n|
      if n==0 || n==1
        @generated_fibs<<n
      else
        @generated_fibs<<(@generated_fibs[-1]+@generated_fibs[-2])
      end
    end
    @generated_fibs
  end
end
