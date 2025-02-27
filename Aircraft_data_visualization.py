import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Load your data
data = pd.read_csv('Aircraft_Engine_Analytics.csv')

# Scatter plot for Engine Temperature vs Vibration Levels
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Engine_Temperature', y='Vibration_Levels', data=data, alpha=0.6)
plt.title('Engine Temperature vs. Vibration Levels')
plt.xlabel('Engine Temperature')
plt.ylabel('Vibration Levels')
plt.grid(True)
plt.show()

# Bar plot for failures by flight phase
plt.figure(figsize=(10, 6))
failure_by_phase = data[data['Failure_Report'] != 'No Failure'].groupby('Flight_Phase').size()
sns.barplot(x=failure_by_phase.index, y=failure_by_phase.values, palette='Blues_d')
plt.title('Failure Counts by Flight Phase')
plt.xlabel('Flight Phase')
plt.ylabel('Failure Count')
plt.xticks(rotation=45)
plt.show()


# Bar plot for average fuel consumption by flight phase
plt.figure(figsize=(10, 6))
avg_fuel_by_phase = data.groupby('Flight_Phase')['Fuel_Consumption'].mean()
sns.barplot(x=avg_fuel_by_phase.index, y=avg_fuel_by_phase.values, palette='Oranges_d')
plt.title('Average Fuel Consumption by Flight Phase')
plt.xlabel('Flight Phase')
plt.ylabel('Average Fuel Consumption')
plt.xticks(rotation=45)
plt.show()

# Histogram for Engine Temperature
plt.figure(figsize=(10, 6))
sns.histplot(data['Engine_Temperature'], bins=30, kde=True, color='blue')
plt.title('Distribution of Engine Temperature')
plt.xlabel('Engine Temperature')
plt.ylabel('Frequency')
plt.show()

# Bar plot for failures by RPM
plt.figure(figsize=(10, 6))
failure_by_rpm = data[data['Failure_Report'] != 'No Failure'].groupby('Engine_RPM').size()
sns.barplot(x=failure_by_rpm.index, y=failure_by_rpm.values, palette='Reds_d')
plt.title('Failure Frequency by Engine RPM')
plt.xlabel('Engine RPM')
plt.ylabel('Failure Count')
plt.xticks(rotation=45)
plt.show()

# Correlation heatmap for key parameters
plt.figure(figsize=(10, 6))
corr = data[['Engine_Temperature', 'Vibration_Levels', 'Fuel_Consumption', 'Engine_RPM']].corr()
sns.heatmap(corr, annot=True, cmap='coolwarm', fmt='.2f')
plt.title('Correlation Heatmap of Key Engine Parameters')
plt.show()


# Assuming you have a timestamp column
data['Timestamp'] = pd.to_datetime(data['Timestamp'])  # Convert to datetime
data.set_index('Timestamp', inplace=True)

plt.figure(figsize=(10, 6))
sns.lineplot(data=data, x=data.index, y='Engine_Temperature', color='green')
plt.title('Engine Temperature Over Time')
plt.xlabel('Time')
plt.ylabel('Engine Temperature')
plt.xticks(rotation=45)
plt.show()



