class CreateTables < ActiveRecord::Migration
  def change
     create_table  :users do |t|
      t.string    :email
      t.string    :password_digest
      t.string    :username
      t.string    :roles, default: "--- []"    # admin, agent, rider, driver
      t.string    :first_name
      t.string    :last_name
      t.string    :phone

      t.timestamps
    end

    create_table  :riders do |t|
      t.integer   :user_id
      t.decimal   :balance, :precision => 8, :scale => 2

      t.timestamps
    end

    create_table  :drivers do |t|
      t.string    :supervisor
      t.integer   :user_id
      t.timestamps
    end

    create_table  :vans do |t|
      t.string    :designation
      t.integer   :capacity

      t.timestamps
    end

    create_table  :routes do |t|
      t.string    :designation
      t.string    :origin
      t.string    :destination
      t.string    :path

      t.timestamps
    end

    create_table   :passengers do |t|
      t.integer    :trip_id
      t.integer    :rider_id

      t.timestamps
    end

    create_table  :trips do |t|
      t.integer   :van_id
      t.integer   :driver_id
      t.integer   :route_id
      t.datetime  :departure

      t.timestamps
    end    

  end
end
