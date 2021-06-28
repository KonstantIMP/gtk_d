module gdk.EventSequence;

private import gdk.c.functions;
public  import gdk.c.types;


/**
 * `GdkEventSequence` is an opaque type representing a sequence
 * of related touch events.
 */
public struct EventSequence
{

	/** */
	public static GType getType()
	{
		return gdk_event_sequence_get_type();
	}
}
