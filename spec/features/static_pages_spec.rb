require 'spec_helper'

describe "Static pages" do
  subject { page }

  let(:base_title){"Ruby on Rails Tutorial Sample App | "}

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title("#{base_title}#{page_title}")}
  end


  describe "Home page" do
    before { visit root_path}
  #  it {should have_content('Sample App')}
   # it {should have_title("#{base_title}Home")}
    let(:heading) { 'Sample App' }
    let(:page_title) {''}

    it_should_behave_like "all static pages"
#    it { should_not have_title('| Home')}
  end


  describe "Helper page" do
    before { visit help_path }
    #it {should have_content('Help')}
    #it {should have_title("#{base_title}Help")}
    let(:heading) {'Help'}
    let(:page_title) {'Hlep'}
  end

  describe "About page" do
    before { visit about_path }
    #it {should have_content('About Us')}
    #it {should have_title("#{base_title}About Us")}
    let(:heading) {'About'}
    let(:page_title) {'About'}
  end

  describe "Contact page" do
    before { visit contact_path }
    #it {should have_title("#{base_title}Contact")}
    #it {should have_selector('h1', text: 'Contact')}
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title("#{base_title}About")
    click_link "Help"
    expect(page).to have_title("#{base_title}Help")
    
  end
end
