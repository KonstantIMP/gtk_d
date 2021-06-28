module gdk.ButtonEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to a button on a pointer device.
 */
public class ButtonEvent : Event
{
	/** the main Gtk struct */
	protected GdkButtonEvent* gdkButtonEvent;

	/** Get the main Gtk struct */
	public GdkButtonEvent* getButtonEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkButtonEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkButtonEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkButtonEvent* gdkButtonEvent, bool ownedRef = false)
	{
		this.gdkButtonEvent = gdkButtonEvent;
		super(cast(GdkEvent*)gdkButtonEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_button_event_get_type();
	}

	/**
	 * Extract the button number from a button event.
	 *
	 * Returns: the button of @event
	 */
	public uint getButton()
	{
		return gdk_button_event_get_button(cast(GdkEvent*)gdkButtonEvent);
	}
}
