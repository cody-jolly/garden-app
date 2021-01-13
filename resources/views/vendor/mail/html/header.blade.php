<tr>
<td class="header">
<a href="{{ $url }}" style="display: inline-block;">
@if (trim($slot) === 'Laravel')
<img src="{{asset('storage/img/garden-app-logo.svg')}}" class="logo" alt="Garden App Logo">
@else
{{ $slot }}
@endif
</a>
</td>
</tr>
