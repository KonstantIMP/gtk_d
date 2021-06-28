module gtk.VolumeButton;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.ScaleButton;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkVolumeButton` is a `GtkScaleButton` subclass tailored for
 * volume control.
 * 
 * ![An example GtkVolumeButton](volumebutton.png)
 */
public class VolumeButton : ScaleButton
{
	/** the main Gtk struct */
	protected GtkVolumeButton* gtkVolumeButton;

	/** Get the main Gtk struct */
	public GtkVolumeButton* getVolumeButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkVolumeButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkVolumeButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkVolumeButton* gtkVolumeButton, bool ownedRef = false)
	{
		this.gtkVolumeButton = gtkVolumeButton;
		super(cast(GtkScaleButton*)gtkVolumeButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_volume_button_get_type();
	}

	/**
	 * Creates a `GtkVolumeButton`.
	 *
	 * The button has a range between 0.0 and 1.0, with a stepping of 0.02.
	 * Volume values can be obtained and modified using the functions from
	 * [class@Gtk.ScaleButton].
	 *
	 * Returns: a new `GtkVolumeButton`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_volume_button_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkVolumeButton*) __p);
	}
}
