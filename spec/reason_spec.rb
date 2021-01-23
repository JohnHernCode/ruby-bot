#!/usr/bin/env ruby

require_relative '../lib/reason'

RSpec.describe 'Reason' do
  let(:values) do
    values = Reason.new
    values.select_value
  end
  describe '#select_value' do
    it 'Should always return a hash' do
      expect(values.class).to be(Hash)
    end
    it 'Should never return a nil result' do
      expect(values).not_to be(nil)
    end
  end
end
