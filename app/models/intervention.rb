class Intervention < ApplicationRecord
    belongs_to :customer, optional: true, foreign_key: :CustomerID
    belongs_to :employee, optional: true, foreign_key: :Author
    belongs_to :building, optional: true, foreign_key: :BuildingID
    belongs_to :battery, optional: true, foreign_key: :BatteryID
    belongs_to :column, optional: true, foreign_key: :ColumnID
    belongs_to :elevator, optional: true, foreign_key: :ElevatorID

    before_create do
        self.Status = "Pending"
    end
    after_create :notify_slack
    after_create :create
    def notify_slack
        if $SlackClient
            text = <<~EOS
                New Intervention ID #{self.id} created by #{self.employee.FirstName} #{self.employee.LastName}:
                Customer Name: #{self.customer.CompanyName}
                Building ID: #{self.building.id}
                Battery ID: #{self.battery.id}
                Column ID: #{self.column.id}
                Elevator ID: #{self.elevator.SerialNumber}
            EOS

            $SlackClient.chat_postMessage(channel: '#interventions', text: text, as_user: true)
        end
    end

    # SLACK_NOTIFIER = Slack::Notifier.new (
    #     "https://hooks.slack.com/services/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",
    #     channel: "#api-weeks-team-nicolas"
    # )
   

    #   require 'slack-notifier'

    #   notifier = Slack::Notifier.new "WEBHOOK_URL"
    #   notifier.ping "Hello World"
      
    #   notifier.ping "Hello default"
    # => if your webhook is setup, will message "Hello World"
    # => to the default channel you set in slack
end
