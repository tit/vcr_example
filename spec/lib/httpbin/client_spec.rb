# frozen_string_literal: true

require_relative '../../../lib/httpbin/client'

describe Httpbin::Client do
  let :client do
    described_class.new
  end

  describe '#slideshow' do
    context 'when server return status 200' do
      let :slideshow do
        VCR.use_cassette 'lib/httpbin/client/slideshow/status_200' do
          client.slideshow[:slideshow]
        end
      end

      it 'then title is equal Sample Slide Show' do
        expect(slideshow[:title]).to eq('Sample Slide Show')
      end
    end

    context 'when server return status 500' do
      let :slideshow do
        VCR.use_cassette 'lib/httpbin/client/slideshow/status_500' do
          client.slideshow[:slideshow]
        end
      end

      it 'then title is equal Sample Slide Show' do
        expect { slideshow[:title] }.to raise_error(StandardError, 'oops')
      end
    end
  end
end
