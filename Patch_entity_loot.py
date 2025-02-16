import os
import sys
import json

#Directory passed to script
directory_path = sys.argv[1]

original_json = {
    "count": {"type": "minecraft:uniform", "max": 1.0, "min": 0.0},
    "enchantment": "minecraft:looting",
    "function": "minecraft:enchanted_count_increase"
}

replacement_json = [
    {
        "count": {"type": "minecraft:uniform", "max": 1.0, "min": 0.0},
        "enchantment": "minecraft:looting",
        "function": "minecraft:enchanted_count_increase"
    },
    {
        "count": {"type": "minecraft:uniform", "max": 1.0, "min": 0.0},
        "enchantment": "magic:looting_no_xp",
        "function": "minecraft:enchanted_count_increase"
    }
]


original_json_str = json.dumps(original_json)


for filename in os.listdir(directory_path):
    file_path = os.path.join(directory_path, filename)

    if filename.endswith('.json'):
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()

            json_data = json.loads(content)

            json_data_str = json.dumps(json_data)

            updated_json_data_str = json_data_str.replace(original_json_str, json.dumps(replacement_json))

            updated_json_data = json.loads(updated_json_data_str)

            with open(file_path, 'w', encoding='utf-8') as file:
                json.dump(updated_json_data, file, indent=4)

            print(f"Updated: {file_path}")

        except json.JSONDecodeError as e:
            print(f"Error decoding JSON in file {file_path}: {e}")
        except Exception as e:
            print(f"An error occurred while processing {file_path}: {e}")