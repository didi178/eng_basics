class Fib < ApplicationRecord
	serialize :generated_fibs, Array
	attribute :nums

	before_save :new_generation

	def new_generation
		self.generated_fibs = self.generate nums.to_i if nums
	end

	def generate x
      if self.generated_fibs.length < x
        generate_fibs x
      else
        self.generated_fibs.take x
      end
    end

  def is_known_fib? num
      self.generated_fibs.include? num
  end

  def all_fibs? seq_array
    seq_array.each do |n|
      return false if ! is_known_fib? n
    end
    true
  end

  def known_fibs_sum_of_squares
    self.generated_fibs.inject(0){|sum_of_squares,x| sum_of_squares+x**2 }
  end

  private

  def generate_fibs x
    # this method should do the work of generating the sequence
    y = self.generated_fibs.length
    (y...x).each do |n|
      if n==0 || n==1
        self.generated_fibs<<n
      else
        self.generated_fibs<<(self.generated_fibs[-1]+self.generated_fibs[-2])
      end
    end
    self.generated_fibs
  end

end
