# update_ranking.py

import requests
import yaml
from bs4 import BeautifulSoup

# URL of the university ranking page
url = "https://www.topuniversities.com/universities/kth-royal-institute-technology"

# Fetch the HTML content of the page
response = requests.get(url)
soup = BeautifulSoup(response.content, "html.parser")

# Extract the rank
rank_tag = soup.find(
    "h3", string=lambda t: "QS World University Rankings" in t if t else False
)

if rank_tag:
    # Use CSS selector to find the span with 'rank-hash'
    rank_span = rank_tag.select_one("span.rank-hash")
    if rank_span and rank_span.next_sibling:
        rank = str(rank_span.next_sibling).strip()
    else:
        rank = "N/A"

    # Update the YAML data file
    ranking_data = {
        "kth": {
            "name": "KTH Royal Institute of Technology",
            "rank": rank,
            "source": "QS World University Rankings",
        }
    }

    with open("_data/university_ranking.yml", "w") as file:
        yaml.dump(ranking_data, file)

    print("Ranking data updated successfully.")
else:
    print("Error: Unable to find the ranking information on the page.")
