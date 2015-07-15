class ChangeFieldsInPages < ActiveRecord::Migration
  def change
  	# PAGES
  	rename_column :pages, :startText, :startText_pl
  	add_column :pages, :startText_en, :text
  	add_column :pages, :startText_it, :text
		rename_column :pages, :aboutText, :aboutText_pl
		add_column :pages, :aboutText_en, :text
		add_column :pages, :aboutText_it, :text
		rename_column :pages, :retailAcademyText, :retailAcademyText_pl
		add_column :pages, :retailAcademyText_en, :text
		add_column :pages, :retailAcademyText_it, :text
		rename_column :pages, :carieerText, :carieerText_pl
		add_column :pages, :carieerText_en, :text
		add_column :pages, :carieerText_it, :text
		rename_column :pages, :contactText, :contactText_pl
		add_column :pages, :contactText_en, :text
		add_column :pages, :contactText_it, :text

		# PORTFOLIO
		rename_column :portfolios, :title, :title_pl
		add_column :portfolios, :title_en, :string
		add_column :portfolios, :title_it, :string
		rename_column :portfolios, :content, :content_pl
		add_column :portfolios, :content_en, :text
		add_column :portfolios, :content_it, :text

		# MADE IN G
		rename_column :made_in_gs, :content, :content_pl
		add_column :made_in_gs, :content_en, :text
		add_column :made_in_gs, :content_it, :text

		# SHOWROOM
		rename_column :showrooms, :content, :content_pl
		add_column :showrooms, :content_en, :text
		add_column :showrooms, :content_it, :text

		# NEWS
		rename_column :news, :content, :content_pl
		add_column :news, :content_en, :text
		add_column :news, :content_it, :text
		add_column :news, :title_pl, :string
		add_column :news, :title_en, :string
		add_column :news, :title_it, :string
		add_column :news, :short_pl, :text
		add_column :news, :short_en, :text
		add_column :news, :short_it, :text
		add_column :news, :active, :boolean	
  end
end
