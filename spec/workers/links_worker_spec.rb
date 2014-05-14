require 'spec_helper'

describe "LinksWorker" do
	describe "Perform check url" do
		let(:data){ {url: "https://www.google.com"} }
		it "Gets a page and puts all the urls in the database" do
			site = Site.create(data)
			LinksWorker.new.perform(site.id)
			site.links.should_not be_nil
			site.links.length.should > 0
		end
	end
end