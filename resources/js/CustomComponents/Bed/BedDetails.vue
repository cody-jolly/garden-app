<template>
    <form @submit.prevent="updateBed()">
        <div class="m2 flex">
            <h4 class="inline-block mr-1">Länge:</h4>
            <jet-input id="length" type="text" class="mt-1 placeholder-black inline-block flex-grow" v-model="form.length" ref="length" :autocomplete="bedLength" required />
            <jet-input-error :message="form.errors.length" class="mt-2" />
        </div>
        <div class="m2 flex">
            <h3 class="inline-block mr-1">Breite:</h3>
            <jet-input id="width" type="text" class="mt-1 placeholder-black inline-block flex-grow" v-model="form.width" ref="width" :autocomplete="bedWidth" required />
            <jet-input-error :message="form.errors.width" class="mt-2" />
        </div>
        <div class="m2">
            Fläche: {{ bedArea }}
        </div>
        <div class="m2">
            Kulturen: ...
        </div>
        <jet-action-message :on="form.recentlySuccessful" class="mr-1">
            Gespeichert.
        </jet-action-message>
        <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
            Änderungen Speichern
        </jet-button>
        <inertia-link class="inline-flex items-center ml-2 px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150"
                      method="delete" as="button" :href.prevent="route('beds.destroy', bedId)" preserve-scroll preserve-state>
            Löschen
        </inertia-link>
    </form>
</template>

<script>
    import JetActionMessage from '@/Jetstream/ActionMessage'
    import JetButton from '@/Jetstream/Button'
    import JetSecondaryButton from '@/Jetstream/SecondaryButton'
    import JetInput from '@/Jetstream/Input'
    import JetInputError from '@/Jetstream/InputError'
    import JetLabel from '@/Jetstream/Label'

    export default {
        props: ['bedId', 'bedLength', 'bedWidth'],

        components: {
            JetActionMessage,
            JetButton,
            JetSecondaryButton,
            JetInput,
            JetInputError,
            JetLabel,
        },

        computed: {
            bedArea: function () {
                return this.bedLength * this.bedWidth
            }
        },

        data() {
            return {
                form: this.$inertia.form({
                    length: this.bedLength,
                    width: this.bedWidth,
                }),
            }
        },

        methods: {
            updateBed() {
                this.form.put(route('beds.update', this.bedId), {
                    preserveScroll: true,
                })
            },
        }
    }
</script>
