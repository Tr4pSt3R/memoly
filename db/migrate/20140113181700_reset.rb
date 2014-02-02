# Establishes reset point for migrations cleared out by the clear_migrations gem.
class Reset < ActiveRecord::Migration
	def self.up
		if ActiveRecord::Migrator.get_all_versions.empty?
			raise "===> USE DB:SCHEMA:LOAD INSTEAD OF DB:MIGRATE 
Migrations for this project have been previously cleared out with the clear_migrations gem. 
To create this project's database on a new system, please use db:schema:load instead of trying to run all the migrations from scratch.

"
		else
			execute "TRUNCATE schema_migrations;"
		end
	end
	def self.down
		raise ActiveRecord::IrreversibleMigration
	end
end
