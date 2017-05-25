require_relative '../fibs'

describe Fibs do
  subject { Fibs.new }

  describe '#generate' do
    let(:expected_result) {
      [ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ]
    }

    it 'returns the number of requested fibonacci numbers' do
      expect( subject.generate(10) ).to eq(expected_result)
    end

    it 'stores the values' do
      subject.generate(10)
      expect( subject.generated_fibs ).to eq(expected_result)
    end

    context 'when it already knows the requested number of sequence numbers' do
      before do
        subject.generate(5)
        allow_any_instance_of(Fibs).to receive(:generate_fibs) { raise Exception }
      end

      it 'does not call generate_fibs' do
        # write an expectation for calling generate
        expect( subject.generate(5) ).to be_truthy
      end
    end
  end

  describe '#is_known_fib?' do

    context 'when passed a fibonacci number that it has not stored' do
      before do
        subject.generate(5)
      end

      it 'returns false' do
        expect( subject.is_known_fib? 34 ).to be false
      end
    end

    context 'when passed a number that has been stored' do
      before do
        subject.generate(10)
      end
      it 'returns true' do
        expect( subject.is_known_fib? 34 ).to be true
      end
    end
  end

  describe '#all_fibs?' do

    context 'when passed an array of numbers that are all members of the the fibonacci sequence' do
      before do
        subject.generate(5)
      end
      it 'returns true' do
        expect( subject.all_fibs? [0,1,1,2,3] ).to be true
      end
    end

    context 'when passed an array of numbers that where at least one is not a member of the sequence' do
      before do
        subject.generate(5)
      end
      it 'returns false' do
         expect( subject.all_fibs? [0,1,1,2,3,4] ).to be false
      end
    end
  end

  describe '#known_fibs_sum_of_squares' do
    let(:expected_result) {
      # the known sum of the squares
      15
    }

    context 'when there are stored numbers' do
      before do
        # seed generated_fibs
        subject.generate(5)
      end

      it 'returns the sum of the squared values for all known fibs' do
        expect( subject.known_fibs_sum_of_squares ).to eq( expected_result )
      end
    end

    context 'when there are no stored numbers' do
      it 'returns 0' do
        expect( subject.known_fibs_sum_of_squares ).to eq( 0 )
      end
    end
  end
end
