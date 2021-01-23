#!/usr/bin/env ruby

require_relative '../lib/reason'

RSpec.describe 'Reason' do
  let(:values) do
    values = Reason.new
    values.select_value
  end
  let(:instance) { Reason.new }

  describe '#select_value' do
    it 'Should always return a hash' do
      expect(values.class).to be(Hash)
    end
    it 'Should never return a nil result' do
      expect(values).not_to be(nil)
    end
  end
  describe 'attr_reader:img' do
    it 'Should return a string' do
      expect(instance.img.class).to be(String)
    end
    it 'Should never return a nil result' do
      expect(values).not_to be(nil)
    end
  end
end
