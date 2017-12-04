require 'active_record'

ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "db/development.sqlite3"
)

class Stock < ApplicationRecord
	def self.import(file)
		#SJIS → UTF-8と文字コードを変換しファイルを開く
		open(file.path, encoding: "Shift_JIS:UTF-8", undef: :replace) do |f|
			csv = CSV.new(f, :headers => :first_row)
			csv.each do |row|
				#同じ日付が見つかればレコード呼び出し、見つからなければ作成
				stock = find_by(:data => row["data"])
				if stock.nil?
					stock = new
				end

				#株価情報の更新
				stock.attributes = row.to_hash.slice(*uppdatable_attributes)

				#保存
				stock.save!
			end
		end
	end

	#更新を許可するカラムを定義
	def self.uppdatable_attributes
		["date","opening_price","high_price","low_price","closing_price","turnover_value","turnover_price"]
	end
end

