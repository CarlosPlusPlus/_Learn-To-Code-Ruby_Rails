require 'rspec'
require_relative './prime_factors'

describe PrimeFactors do
  specify { expect(PrimeFactors.for(1)).to eq [] }
  specify { expect(PrimeFactors.for(2)).to eq [2] }
  specify { expect(PrimeFactors.for(3)).to eq [3] }
  specify { expect(PrimeFactors.for(4)).to eq [2,2] }
  specify { expect(PrimeFactors.for(6)).to eq [2,3] }
  specify { expect(PrimeFactors.for(8)).to eq [2,2,2] }
  specify { expect(PrimeFactors.for(9)).to eq [3,3] }
  specify { expect(PrimeFactors.for(27)).to eq [3,3,3] }
  specify { expect(PrimeFactors.for(625)).to eq [5,5,5,5] }
  specify { expect(PrimeFactors.for(901255)).to eq [5, 17, 23, 461] }
end
