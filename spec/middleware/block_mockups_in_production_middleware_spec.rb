require "spec_helper"

describe Bard::Static::BlockMockupsInProductionMiddleware do
  let(:app) { ->(env) { [200, {}, ["OK"]] } }
  let(:middleware) { described_class.new(app) }
  let(:env) { Rack::MockRequest.env_for(path) }

  describe "in production environment" do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
    end

    context "when path starts with /mockups" do
      let(:path) { "/mockups" }

      it "raises MockupInProductionError" do
        expect {
          middleware.call(env)
        }.to raise_error(Bard::Static::MockupInProductionError, "Mockup pages are not available in production: /mockups")
      end
    end

    context "when path is /mockups/sites" do
      let(:path) { "/mockups/sites" }

      it "raises MockupInProductionError" do
        expect {
          middleware.call(env)
        }.to raise_error(Bard::Static::MockupInProductionError, "Mockup pages are not available in production: /mockups/sites")
      end
    end

    context "when path is nested mockup path" do
      let(:path) { "/mockups/posts/new" }

      it "raises MockupInProductionError" do
        expect {
          middleware.call(env)
        }.to raise_error(Bard::Static::MockupInProductionError, "Mockup pages are not available in production: /mockups/posts/new")
      end
    end

    context "when path does not start with /mockups" do
      let(:path) { "/sites" }

      it "does not raise error" do
        expect {
          middleware.call(env)
        }.not_to raise_error
      end

      it "calls the next middleware" do
        status, _headers, _body = middleware.call(env)
        expect(status).to eq(200)
      end
    end

    context "when path is root" do
      let(:path) { "/" }

      it "does not raise error" do
        expect {
          middleware.call(env)
        }.not_to raise_error
      end

      it "calls the next middleware" do
        status, _headers, _body = middleware.call(env)
        expect(status).to eq(200)
      end
    end
  end

  describe "in non-production environments" do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("test"))
    end

    context "when path starts with /mockups" do
      let(:path) { "/mockups" }

      it "does not raise error" do
        expect {
          middleware.call(env)
        }.not_to raise_error
      end

      it "calls the next middleware" do
        status, _headers, _body = middleware.call(env)
        expect(status).to eq(200)
      end
    end

    context "when path is nested mockup path" do
      let(:path) { "/mockups/posts/new" }

      it "does not raise error" do
        expect {
          middleware.call(env)
        }.not_to raise_error
      end

      it "calls the next middleware" do
        status, _headers, _body = middleware.call(env)
        expect(status).to eq(200)
      end
    end
  end

  describe "in development environment" do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("development"))
    end

    context "when path starts with /mockups" do
      let(:path) { "/mockups" }

      it "does not raise error" do
        expect {
          middleware.call(env)
        }.not_to raise_error
      end

      it "calls the next middleware" do
        status, _headers, _body = middleware.call(env)
        expect(status).to eq(200)
      end
    end
  end
end
