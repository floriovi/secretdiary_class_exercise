require 'secret_diary'

RSpec.describe SecretDiary do
  let(:diary) { SecretDiary.new }
  it { is_expected.to respond_to(:lock) }
  it { is_expected.to respond_to(:unlock) }
  it { is_expected.to respond_to(:add_entry) }
  it { is_expected.to respond_to(:get_entries) }

  it 'SecretDiary class can crete an instance' do
    expect(diary).to be_an_instance_of SecretDiary
  end

  describe '#initialize' do
    it 'starts off as being locked' do
      expect(diary.lock).to eq(true)
    end
  end

  describe '#unlock' do
    it 'unlocks the diary so it can be read or written into' do
      diary.unlock
      expect(diary.unlock).to eq(false)
    end
  end

  describe '#add_entry' do
    it 'adds an entry into the diary if unlocked' do
      diary.unlock
      expect(diary.add_entry("Hello, my name is Vincenzo and I am currently on the 4th week of the Makers bootcamp.")).to eq(["Hello, my name is Vincenzo and I am currently on the 4th week of the Makers bootcamp."])
    end

    it 'denies entry if the book is locked.' do
      expect { diary.add_entry("Hello") }.to raise_error(RuntimeError, "Diary locked!")
    end
  end

    describe '#get_entries' do
      it 'allows you to look at an entry' do
        diary.unlock
        diary.add_entry("Hello, this is a test.")
        expect(diary.get_entries).to eq(["Hello, this is a test."])
      end

      it 'denies entry if the book is locked.' do
        expect { diary.get_entries }.to raise_error(RuntimeError, "Diary locked!")
      end

    end
end