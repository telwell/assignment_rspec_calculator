# Building RSpec tests for the calculator
require "calculator.rb"

describe "Calculator" do
	
	# Adding tests for the #add method
	describe "#add" do
		it 'returns the sum of positive numbers' do
			expect(Calculator.new.add(3,6)).to eq(9)
		end

		it 'returns the sum with negative numbers' do
			expect(Calculator.new.add(3,-6)).to eq(-3)
		end

		it 'returns the sum with floats' do
			expect(Calculator.new.add(3.0,4)).to eq(7)
		end
	end # End add tests

	describe "#subtract" do
		it 'returns the difference of positive numbers' do
			expect(Calculator.new.subtract(7,5)).to eq(2)
		end

		it 'returns the difference with negative numbers' do
			expect(Calculator.new.subtract(3,-6)).to eq(9)
		end

		it 'returns the difference with floats' do
			expect(Calculator.new.subtract(3.0,4)).to eq(-1)
		end
	end # End subtract tests

	describe "#multiply" do
		it 'returns the product of positive numbers' do
			expect(Calculator.new.multiply(7,5)).to eq(35)
		end

		it 'returns the product with negative numbers' do
			expect(Calculator.new.multiply(3,-6)).to eq(-18)
		end

		it 'returns the product with floats' do
			expect(Calculator.new.multiply(3.0,4)).to eq(12)
		end

		it 'returns the product with zero' do
			expect(Calculator.new.multiply(14,0)).to eq(0)
		end
	end # End multiply tests

	describe "#divide" do
		it 'returns the quotient of positive divisible numbers' do
			expect(Calculator.new.divide(25,5)).to eq(5)
		end

		it 'returns the quotient with negative divisible numbers' do
			expect(Calculator.new.divide(9,-3)).to eq(-3)
		end

		it 'returns the quotient with floats' do
			expect(Calculator.new.divide(20.0,4)).to eq(5)
		end

		it 'raises an error if divided by 0' do
			expect{(Calculator.new.divide(14,0))}.to raise_error # This blew up at first. Need to surrount in {}
		end

		it 'expect float if not divisible' do
			expect(Calculator.new.divide(9,5)).to be_a(Float) # This one was in the documentation
		end
	end # End divide tests

	describe "#pow" do
		it 'raises to power of positive numbers' do
			expect(Calculator.new.pow(5,3)).to eq(125)
		end

		it 'raises to powers with negative numbers' do
			expect(Calculator.new.pow(2,-3)).to eq(0.125)
		end

		it 'returns 1 when raised to a power of 0' do
			expect(Calculator.new.pow(3,0)).to eq(1)
		end

		it 'raises to fractional powers' do
			expect(Calculator.new.pow(25,1/2.0)).to eq(5)
		end

		it 'raises to decimal powers' do
			expect(Calculator.new.pow(36,0.5)).to eq(6)
		end
	end # End pow tests

	describe "#sqrt" do
		it 'returns the sqrt of positive numbers' do
			expect(Calculator.new.sqrt(9)).to eq(3)
		end

		it 'raises error for negative numbers' do
			expect{(Calculator.new.sqrt(-6))}.to raise_error
		end

		it 'returns float with non-square numbers' do
			expect(Calculator.new.sqrt(8)).to be_a(Float)
		end
	end # End sqrt tests

	describe "#memory" do
		# Wanted to experiment with let
		let(:test_calc){Calculator.new}

		it 'returns nil when there is nothing saved' do
			expect(Calculator.new.memory).to be_nil
		end

		# I'm unsure if this is the best way to test this.
		it 'can recall a number' do
			test_calc.memory=(8)
			expect(test_calc.memory).to eq(8)
		end

		it 'clears the memory after recalled' do
			test_calc.memory=(8)
			test_calc.memory
			expect(test_calc.memory).to be_nil
		end
	end # End memory tests

	describe "#stringify" do
		# Make a stringify calculator
		let(:string_calc){Calculator.new(true)}

		it 'returns string with add' do
			expect(string_calc.add(1,2)).to eq("3")
		end

		it 'returns string with subtract' do
			expect(string_calc.subtract(5,2)).to eq("3")
		end

		it 'returns string with multiply' do
			expect(string_calc.multiply(5,2)).to eq("10")
		end

		it 'returns string with divide' do
			expect(string_calc.divide(30,5)).to eq("6")
		end

		it 'returns string with pow' do
			expect(string_calc.pow(5,2)).to eq("25.0")
		end

		it 'returns string with sqrt' do
			expect(string_calc.sqrt(49)).to eq("7")
		end # End stringify tests
	end
end