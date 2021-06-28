module gdk.ProximityEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to the proximity of a tool to a device.
 */
public class ProximityEvent : Event
{
	/** the main Gtk struct */
	protected GdkProximityEvent* gdkProximityEvent;

	/** Get the main Gtk struct */
	public GdkProximityEvent* getProximityEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkProximityEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkProximityEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkProximityEvent* gdkProximityEvent, bool ownedRef = false)
	{
		this.gdkProximityEvent = gdkProximityEvent;
		super(cast(GdkEvent*)gdkProximityEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_proximity_event_get_type();
	}
}
