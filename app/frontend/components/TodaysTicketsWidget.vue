<template>
  <div style="border:2px solid red; padding:1rem;">
    <h2>Today's Tickets</h2>
    <ul v-if="tickets.length">
      <li v-for="ticket in tickets" :key="ticket.id">{{ ticket.title }}</li>
    </ul>
    <div v-else>No tickets for today.</div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from "vue";

const tickets = ref<{ id: string; title: string }[]>([]);

onMounted(async () => {
  try {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");

    const res = await fetch("/graphql", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken || ""
      },
      body: JSON.stringify({
        query: `query { todaysTickets { id title } }`
      })
    });

    const json = await res.json();
    tickets.value = json.data?.todaysTickets || [];

  } catch (err) {
    console.error("Error fetching tickets", err);
  }
});
</script>
