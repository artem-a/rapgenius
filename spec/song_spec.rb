require 'spec_helper'

describe RapGenius::Song do

  subject { described_class.new("foobar") }

  before do
    RapGenius::Song.any_instance.stubs(:fetch).
      returns(File.read(File.expand_path("../support/song.html", __FILE__)))
  end
  
  its(:url) { should eq "http://rapgenius.com/foobar" }
  its(:title) { should eq "Control" }
  its(:artist) { should eq "Big Sean" }
  its(:description) { should include "blew up the Internet" }
  its(:images) { should be_a Array }

  its(:images) do
    should include(
      "http://s3.amazonaws.com/rapgenius/1375029260_Big%20Sean.png"
    )
  end

  its(:full_artist) { should include "(Ft. Jay Electronica & Kendrick Lamar)"}
  its(:annotations) { should be_a Array }
  its("annotations.length") { should eq 132 }
  its("annotations.first") { should be_a RapGenius::Annotation }

end