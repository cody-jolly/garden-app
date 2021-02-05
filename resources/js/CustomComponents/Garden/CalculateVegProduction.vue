<template>
    <form @submit.prevent="calculateGardenPlan()" class="inline-block ml-1">
        <jet-action-message :on="form.recentlySuccessful" class="mr-1">
            Anbauplan erfolgreich generiert.
        </jet-action-message>
        <jet-button class="{ 'opacity-25': form.processing }" :disabled="form.processing">
            Anbauplan Generieren
        </jet-button>
    </form>
</template>

<script>
    import JetButton from '@/Jetstream/Button'
    import JetActionMessage from "@/Jetstream/ActionMessage";

    export default {
        props: ['gardenId'],

        components: {
            JetButton,
            JetActionMessage,
        },

        data() {
            return {
                form: this.$inertia.form({
                    garden_id: this.gardenId,
                }),
            }
        },

        methods: {
            calculateGardenPlan() {
                console.log('planning the thing...')
                this.form.post(route('calculate-veg-production'), {
                    preserveScroll: true,
                })
            }
        },

    }
</script>
