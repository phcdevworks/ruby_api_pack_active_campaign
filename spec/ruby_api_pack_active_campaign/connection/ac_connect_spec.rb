# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RubyApiPackActiveCampaign::Connection::AcConnect do
  let(:connection) { described_class.new(ac_api_url_base, ac_api_path) }
  let(:ac_api_url_base) { 'https://youraccountname.api-us1.com/api/3' }
  let(:ac_api_path) { '/contacts' }
  let(:ac_token) { 'your_fake_api_token' }
  let(:payload) { { contact: { email: 'test@example.com', first_name: 'John', last_name: 'Doe' } } }
  let(:http_response) { instance_double(HTTParty::Response, code: 200, body: '{"message": "Success"}') }

  before do
    allow(RubyApiPackActiveCampaign).to receive(:configuration).and_return(
      instance_double(RubyApiPackActiveCampaign::Configuration, ac_api_token: ac_token)
    )
  end

  describe '#ac_post_api_connection' do
    before do
      allow(HTTParty).to receive(:post).and_return(http_response)
    end

    it 'creates a HTTParty POST connection' do
      connection.ac_post_api_connection(payload)

      expect(HTTParty).to have_received(:post).with(
        "#{ac_api_url_base}#{ac_api_path}",
        headers: {
          'Api-Token' => ac_token,
          'Content-Type' => 'application/json'
        },
        body: payload.to_json
      )
    end

    it 'returns a successful response' do
      response = connection.ac_post_api_connection(payload)
      expect(response['message']).to eq('Success')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 500, body: '{"error":"Server error"}') }

      before do
        allow(HTTParty).to receive(:post).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect do
          connection.ac_post_api_connection(payload)
        end.to raise_error('API Request failed with status 500: {"error":"Server error"}')
      end
    end

    context 'when parsing the response fails' do
      let(:faulty_response) { instance_double(HTTParty::Response, code: 200, body: 'invalid_json') }

      before do
        allow(HTTParty).to receive(:post).and_return(faulty_response)
        allow(JSON).to receive(:parse).and_raise(JSON::ParserError.new('Unexpected token'))
      end

      it 'raises a parsing error' do
        expect { connection.ac_post_api_connection(payload) }.to raise_error(/Error parsing response: Unexpected token/)
      end
    end
  end

  describe '#ac_get_api_connection' do
    before do
      allow(HTTParty).to receive(:get).and_return(http_response)
    end

    it 'creates a HTTParty GET connection' do
      connection.ac_get_api_connection

      expect(HTTParty).to have_received(:get).with(
        "#{ac_api_url_base}#{ac_api_path}",
        headers: {
          'Api-Token' => ac_token
        }
      )
    end

    it 'returns a successful response' do
      response = connection.ac_get_api_connection
      expect(response['message']).to eq('Success')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 404, body: '{"error":"Not found"}') }

      before do
        allow(HTTParty).to receive(:get).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect do
          connection.ac_get_api_connection
        end.to raise_error('API Request failed with status 404: {"error":"Not found"}')
      end
    end
  end

  describe '#ac_put_api_connection' do
    before do
      allow(HTTParty).to receive(:put).and_return(http_response)
    end

    it 'creates a HTTParty PUT connection' do
      connection.ac_put_api_connection(payload)

      expect(HTTParty).to have_received(:put).with(
        "#{ac_api_url_base}#{ac_api_path}",
        headers: {
          'Api-Token' => ac_token,
          'Content-Type' => 'application/json'
        },
        body: payload.to_json
      )
    end

    it 'returns a successful response' do
      response = connection.ac_put_api_connection(payload)
      expect(response['message']).to eq('Success')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 400, body: '{"error":"Bad request"}') }

      before do
        allow(HTTParty).to receive(:put).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect do
          connection.ac_put_api_connection(payload)
        end.to raise_error('API Request failed with status 400: {"error":"Bad request"}')
      end
    end
  end

  describe '#ac_delete_api_connection' do
    before do
      allow(HTTParty).to receive(:delete).and_return(http_response)
    end

    it 'creates a HTTParty DELETE connection' do
      connection.ac_delete_api_connection

      expect(HTTParty).to have_received(:delete).with(
        "#{ac_api_url_base}#{ac_api_path}",
        headers: {
          'Api-Token' => ac_token
        }
      )
    end

    it 'returns a successful response' do
      response = connection.ac_delete_api_connection
      expect(response['message']).to eq('Success')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 403, body: '{"error":"Forbidden"}') }

      before do
        allow(HTTParty).to receive(:delete).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect do
          connection.ac_delete_api_connection
        end.to raise_error('API Request failed with status 403: {"error":"Forbidden"}')
      end
    end
  end
end
