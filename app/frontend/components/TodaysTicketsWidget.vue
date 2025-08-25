<template>
  <div style="border:2px solid red; padding:1rem;">
    <h3>Today's Tickets</h3>
    <ul v-if="tickets.length">
      <li v-for="ticket in tickets" :key="ticket.id">{{ ticket.title }}</li>
    </ul>
    <p v-else>No tickets for today.</p>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

interface Ticket {
  id: number;
  title: string;
}

const tickets = ref<Ticket[]>([]);

onMounted(async () => {
  try {
    const res = await fetch('/graphql', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        query: `
          {
            todaysTickets {
              id
              title
            }
          }
        `
      })
    });

    const json = await res.json();
    if (json.data && json.data.todaysTickets) {
      tickets.value = json.data.todaysTickets;
    } else {
      console.error('GraphQL response invalid', json);
    }
  } catch (err) {
    console.error('Error fetching tickets', err);
  }
});
</script>
