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
end