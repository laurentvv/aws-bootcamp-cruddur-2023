### Créer un budget
aws budgets create-budget \
    --account-id $AWS_ACCOUNT_ID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/notifications-with-subscribers.json

### Créer un envoi de mail

aws sns create-topic --name billing-alarm
{
    "TopicArn": "arn:aws:sns:eu-west-3:320877251557:billing-alarm"
}

aws sns subscribe \
    --topic-arn "arn:aws:sns:eu-west-3:320877251557:billing-alarm" \
    --protocol email \
    --notification-endpoint volff.laurent@gmail.com

# Pour suivre sur AWS : https://eu-west-3.console.aws.amazon.com/sns/v3/home?region=eu-west-3#/topic/arn:aws:sns:eu-west-3:320877251557:billing-alarm


###  Créer une alarme

aws cloudwatch put-metric-alarm --cli-input-json file://aws/json/alarm_config.json

# Pour suivre sur AWS : https://eu-west-3.console.aws.amazon.com/cloudwatch/home?region=eu-west-3#alarmsV2:alarm/DailyEstimatedCharges?