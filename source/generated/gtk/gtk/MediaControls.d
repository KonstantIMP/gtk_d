module gtk.MediaControls;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.MediaStream;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkMediaControls` is a widget to show controls for a video.
 * 
 * ![An example GtkMediaControls](media-controls.png)
 * 
 * Usually, `GtkMediaControls` is used as part of [class@Gtk.Video].
 */
public class MediaControls : Widget
{
	/** the main Gtk struct */
	protected GtkMediaControls* gtkMediaControls;

	/** Get the main Gtk struct */
	public GtkMediaControls* getMediaControlsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMediaControls;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMediaControls;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMediaControls* gtkMediaControls, bool ownedRef = false)
	{
		this.gtkMediaControls = gtkMediaControls;
		super(cast(GtkWidget*)gtkMediaControls, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_media_controls_get_type();
	}

	/**
	 * Creates a new `GtkMediaControls` managing the @stream passed to it.
	 *
	 * Params:
	 *     stream = a #GtkMediaStream to
	 *         manage or %NULL for none.
	 *
	 * Returns: a new `GtkMediaControls`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(MediaStream stream)
	{
		auto __p = gtk_media_controls_new((stream is null) ? null : stream.getMediaStreamStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkMediaControls*) __p);
	}

	/**
	 * Gets the media stream managed by @controls or %NULL if none.
	 *
	 * Returns: The media stream managed by @controls
	 */
	public MediaStream getMediaStream()
	{
		auto __p = gtk_media_controls_get_media_stream(gtkMediaControls);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MediaStream)(cast(GtkMediaStream*) __p);
	}

	/**
	 * Sets the stream that is controlled by @controls.
	 *
	 * Params:
	 *     stream = a `GtkMediaStream`, or %NULL
	 */
	public void setMediaStream(MediaStream stream)
	{
		gtk_media_controls_set_media_stream(gtkMediaControls, (stream is null) ? null : stream.getMediaStreamStruct());
	}
}
